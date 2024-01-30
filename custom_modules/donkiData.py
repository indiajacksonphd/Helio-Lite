import os
import requests
from datetime import datetime, timedelta
import json
import ipywidgets as widgets
from ipywidgets import HBox, VBox, Label, Box, Layout, Button, Image, HTML
from IPython.display import display, HTML


def save_data_to_file(data, filename):
    os.makedirs("donki_data", exist_ok=True)

    save_path = os.path.join("donki_data", filename)
    with open(save_path, 'w') as file:
        json.dump(data, file, indent=4)
    print(f"Data saved to {filename}")

def create_save_button(data, start_date, end_date):
    filename = f"donki_data_{start_date}_to_{end_date}.json"
    save_button = widgets.Button(description="Save Data")
    
    def on_save_button_clicked(b):
        save_data_to_file(data, filename)
    
    save_button.on_click(on_save_button_clicked)
    display(save_button)


def fetch_space_weather_data(start_date, end_date, solar_flare=False, sep=False, cme=False):
    base_url = "https://kauai.ccmc.gsfc.nasa.gov/DONKI/WS/get/"
    data = {}

    if solar_flare:
        url = f"{base_url}FLR?startDate={start_date}&endDate={end_date}"
        response = requests.get(url)
        response.raise_for_status()  # Raise an error if the request fails
        data['solar_flare'] = response.json() if response.status_code == 200 else "Failed to fetch solar flare data"

    if sep:
        url = f"{base_url}SEP?startDate={start_date}&endDate={end_date}"
        response = requests.get(url)
        response.raise_for_status()  # Raise an error if the request fails
        data['sep'] = response.json() if response.status_code == 200 else "Failed to fetch SEP data"

    if cme:
        url = f"{base_url}CME?startDate={start_date}&endDate={end_date}"
        response = requests.get(url)
        response.raise_for_status()  # Raise an error if the request fails
        data['cme'] = response.json() if response.status_code == 200 else "Failed to fetch CME data"

    create_save_button(data, start_date, end_date)
    return data

def format_solar_flare_data(solar_flare_data):
    for event in solar_flare_data:
        #print(event)  # This will print each solar flare event's details
        # You can access specific details like event['flrID'], event['beginTime'], etc.
        html_content = f"<div style='border:1px solid #ddd; padding:10px;'>"
        html_content += f"<h3>Solar Flare Information</h3>"
        html_content += f"<p><b>FLR ID:</b> {event['flrID']}</p>"
        html_content += f"<p><b>Instruments:</b> {event['instruments'][0]['displayName']}</p>"
        html_content += f"<p><b>Begin Time:</b> {event['beginTime']}</p>"
        html_content += f"<p><b>Peak Time:</b> {event['peakTime']}</p>"
        html_content += f"<p><b>End Time:</b> {event.get('endTime', 'N/A')}</p>"
        html_content += f"<p><b>Class Type:</b> {event['classType']}</p>"
        html_content += f"<p><b>Source Location:</b> {event['sourceLocation']}</p>"
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', [])])
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', []) if linked_event is not None])
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', []) if linked_event and 'activityID' in linked_event])
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', []) if linked_event is not None])
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', []) if linked_event is not None])
        # Check if 'linkedEvents' exists before joining
        linked_events = event.get('linkedEvents')
        if linked_events:
            linked_events = ', '.join([linked_event['activityID'] for linked_event in linked_events])
            html_content += f"<p><b>Linked Events:</b> {linked_events}</p>"
        else:
            html_content += f"<p><b>Linked Events:</b> None</p>"

        html_content += f"<p><b>Linked Events:</b> {linked_events}</p>"
        html_content += f"<p><b>Active Region Number:</b> {event['activeRegionNum']}</p>"
        html_content += f"<p><b>Link:</b> <a href='{event['link']}'>View More</a></p>"
        html_content += "</div>"
    
        # display(HTML(html_content))
        return html_content

def format_sep_data(solar_energetic_particle_data):
    for event in solar_energetic_particle_data:
        #print(event)  # This will print each solar flare event's details
        # You can access specific details like event['flrID'], event['beginTime'], etc.
        html_content = f"<div style='border:1px solid #ddd; padding:10px;'>"
        html_content += f"<h3>Solar Energetic Particle Information</h3>"
        html_content += f"<p><b>SEP ID:</b> {event['sepID']}</p>"
        html_content += f"<p><b>Event Time:</b> {event['eventTime']}</p>"
        html_content += f"<p><b>Instruments:</b> {event['instruments'][0]['displayName']}</p>"
        # linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', [])])
        linked_events = ', '.join([linked_event['activityID'] for linked_event in event.get('linkedEvents', []) if linked_event is not None])
        html_content += f"<p><b>Linked Events:</b> {linked_events}</p>"
        html_content += f"<p><b>Link:</b> <a href='{event['link']}'>View More</a></p>"
        html_content += "</div>"
        # display(HTML(html_content))
        return html_content

def format_cme_data(coronal_mass_ejection_data):
    all_html_content = "" 
    for event in coronal_mass_ejection_data:
        html_content = "<div style='border:1px solid #ddd; padding:10px;'>"
        html_content += "<h3>Coronal Mass Ejection (CME) Information</h3>"
        html_content += f"<p><b>Activity ID:</b> {event['activityID']}</p>"
        html_content += f"<p><b>Catalog:</b> {event['catalog']}</p>"
        html_content += f"<p><b>Start Time:</b> {event['startTime']}</p>"
        html_content += f"<p><b>Source Location:</b> {event['sourceLocation']}</p>"
        html_content += f"<p><b>Active Region Number:</b> {event['activeRegionNum']}</p>"
        html_content += f"<p><b>Note:</b> {event['note']}</p>"
        # Instruments
        instruments = ', '.join([instr['displayName'] for instr in event['instruments']])
        html_content += f"<p><b>Instruments:</b> {instruments}</p>"
        html_content += "</div>"
        # display(HTML(html_content))
        
        for analysis in event.get('cmeAnalyses', []):
            analysis_html = "<div style='border:1px solid #ddd; padding:10px;'>"
            analysis_html += "<h3>CME Analysis</h3>"
            analysis_html += f"<p><b>Time:</b> {analysis['time21_5']}</p>"
            analysis_html += f"<p><b>Latitude:</b> {analysis['latitude']}</p>"
            analysis_html += f"<p><b>Longitude:</b> {analysis['longitude']}</p>"
            analysis_html += f"<p><b>Half-Angle:</b> {analysis['halfAngle']}</p>"
            analysis_html += f"<p><b>Speed:</b> {analysis['speed']}</p>"
            analysis_html += f"<p><b>Type:</b> {analysis['type']}</p>"
            analysis_html += f"<p><b>Most Accurate?</b> {analysis['isMostAccurate']}</p>"
            analysis_html += f"<p><b>Note:</b> {analysis['note']}</p>"
            analysis_html += f"<p><b>Level of Data:</b> {analysis['levelOfData']}</p>"
            analysis_html += f"<p><b>Link:</b> <a href='{analysis['link']}'>Link</a></p>"
            analysis_html += "</div>"
            html_content += analysis_html
            # display(HTML(html_content))
        all_html_content += html_content
    return all_html_content

def fetch_donki_data(start_date, end_date, solar_flare=False, sep=False, cme=False):
    data = fetch_space_weather_data(start_date, end_date, solar_flare, sep, cme)
    # create_save_button(data, start_date, end_date)
    widgets_to_display = []

    if solar_flare and 'solar_flare' in data:
        widgets_to_display.append(widgets.HTML(value=format_solar_flare_data(data['solar_flare'])))

    if sep and 'sep' in data:
        widgets_to_display.append(widgets.HTML(value=format_sep_data(data['sep'])))

    if cme and 'cme' in data:
        widgets_to_display.append(widgets.HTML(value=format_cme_data(data['cme'])))

    hbox = HBox(widgets_to_display)
    display(hbox)