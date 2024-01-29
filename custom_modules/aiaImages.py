import os
import requests
import base64
from bs4 import BeautifulSoup
from PIL import Image as pilImage
from io import BytesIO
import ipywidgets as widgets
from ipywidgets import HBox, VBox, Label, Box, Layout, Button, Image, HTML
from IPython.display import display, clear_output
import matplotlib.pyplot as plt
import numpy as np
from datetime import datetime, timedelta

selected_images = [] 
out = widgets.Output()

def save_images(b):
    date_str = datetime.now().strftime("%Y_%m_%d")
    os.makedirs(date_str, exist_ok=True)
    
    for selected_href in selected_images:
        selected_url = base_url + selected_href
        response = requests.get(selected_url)
        if response.status_code == 200:
            image = pilImage.open(BytesIO(response.content))
            image_filename = os.path.basename(selected_href).replace('.jp2', '.png')
            save_path = os.path.join(date_str, image_filename)
            image.save(save_path)
            # image.save(image_filename)
            print(f'Saved {image_filename}')

def on_selection_change(change):
    if change['type'] == 'change' and change['name'] == 'value':
        selected_images[:] = change['new']
        with out:
            clear_output(wait=True)  # Clear the previous output
            # Start with an empty list for your images
            html_images = []
            
            # Loop through your images and create an HTML string for each
            for selected_href in selected_images:
                selected_url = base_url + selected_href
                response = requests.get(selected_url)
                
                if response.status_code == 200:
                        with BytesIO(response.content) as img_io:
                            pil_image = pilImage.open(img_io)
                            pil_image.thumbnail((256, 256))
                            with BytesIO() as buffer:
                                pil_image.save(buffer, format="PNG")
                                buffer.seek(0)
                                image_png_bytes = buffer.getvalue()
                                # Convert to base64 for HTML embedding
                                image_base64 = base64.b64encode(image_png_bytes).decode('utf-8')
                                # image_data = base64.b64encode(response.content).decode('utf-8')
                                filename = os.path.basename(selected_href)
                                sdo_index = filename.find('__SDO')
                                trimmed_filename = filename[:sdo_index] if sdo_index != -1 else filename
                        
                                # Create the image HTML tag with a base64 encoded source
                                img_tag = f'<img src="data:image/png;base64,{image_base64}" style="width: 256px; height: 256px; margin: 2px;"/>'
                                # Optionally, add a caption
                                caption = f'<div style="text-align: center; width: 256px;">{trimmed_filename}</div>'
                                # Combine the image and the caption in a div
                                img_div = f'<div style="display: inline-block; width: 260px;">{caption}{img_tag}</div>'
                                
                                # Append the div to the list of images
                                html_images.append(img_div)
                        
            # Combine all the image divs and put them inside a scrollable container
            scrollable_container = f'''
            <div style="overflow-x: auto; white-space: nowrap; width: 100%; border: 1px solid #ccc;">
                {''.join(html_images)}
            </div>
            '''
                        
            # Display the HTML widget with the scrollable container
            display(HTML(scrollable_container))


# Fetch and parse the HTML content to create the selection menu
def fetch_aia_images(year, month, day, wavelength):
    global base_url, selection_menu, save_button
    base_url = f'http://jsoc.stanford.edu/data/aia/images/{year:04d}/{month:02d}/{day:02d}/{wavelength}/'
    response = requests.get(base_url)
    soup = BeautifulSoup(response.content, 'html.parser')

    options = [a['href'] for a in soup.find_all('a', href=True) if a['href'].endswith('.jp2')]
    selection_menu = widgets.SelectMultiple(options=[(os.path.basename(href), href) for href in options],
                                            disabled=False,
                                            rows=10)

    # Create the button widget
    save_button = widgets.Button(description="Save Images", layout = Layout( margin='20px 0 0 0'))

    # Display widgets
    label = Label('Select Your Images', layout = Layout(display='flex', justify_content='center', align_items='center'))
    scene = VBox([selection_menu, save_button], layout = Layout(display='flex', justify_content='center', align_items='center', margin='0 0 20px 0'))
    # display(selection_menu, save_button, out)
    display(label, scene, out)
    
    # Set event handlers
    selection_menu.observe(on_selection_change, names='value')
    save_button.on_click(save_images)
