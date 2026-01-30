#!/usr/bin/env python3
"""
Build script for bits.alexalemi.com

Generates:
- bits.html: The main stream page
- bits.xml: RSS feed for bits

Usage:
    python build_bits.py
"""

import json
from datetime import datetime
from pathlib import Path
from xml.etree import ElementTree as ET
from xml.dom import minidom

from jinja2 import Environment, FileSystemLoader


def load_bits(path: Path) -> list[dict]:
    """Load bits from JSON file, sorted by date descending."""
    with open(path) as f:
        bits = json.load(f)
    # Sort by date, newest first
    bits.sort(key=lambda x: x.get("date", ""), reverse=True)
    return bits


def build_html(bits: list[dict], template_dir: Path, output_path: Path):
    """Render bits.html from template."""
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template("bits.tpl")
    html = template.render(bits=bits)
    output_path.write_text(html)
    print(f"Generated {output_path}")


def build_rss(bits: list[dict], output_path: Path):
    """Generate RSS feed for bits."""
    # Create RSS structure
    rss = ET.Element("rss", version="2.0")
    rss.set("xmlns:atom", "http://www.w3.org/2005/Atom")
    rss.set("xmlns:content", "http://purl.org/rss/1.0/modules/content/")

    channel = ET.SubElement(rss, "channel")

    # Channel metadata
    ET.SubElement(channel, "title").text = "Bits.AlexAlemi.com"
    ET.SubElement(channel, "link").text = "https://bits.alexalemi.com"
    ET.SubElement(channel, "description").text = "Alex Alemi's Bits - Short thoughts, links, and finds"
    ET.SubElement(channel, "language").text = "en"

    atom_link = ET.SubElement(channel, "{http://www.w3.org/2005/Atom}link")
    atom_link.set("href", "https://bits.alexalemi.com/bits.xml")
    atom_link.set("rel", "self")
    atom_link.set("type", "application/rss+xml")

    ET.SubElement(channel, "lastBuildDate").text = datetime.now().strftime("%a, %d %b %Y %H:%M:%S +0000")

    # Image
    image = ET.SubElement(channel, "image")
    ET.SubElement(image, "url").text = "https://bits.alexalemi.com/favicon.ico"
    ET.SubElement(image, "title").text = "Bits.AlexAlemi.com"
    ET.SubElement(image, "link").text = "https://bits.alexalemi.com"

    # Add items
    for bit in bits:
        item = ET.SubElement(channel, "item")
        ET.SubElement(item, "title").text = bit["title"]

        # Link to external URL if present, otherwise anchor on bits page
        if bit.get("url"):
            ET.SubElement(item, "link").text = bit["url"]
        else:
            ET.SubElement(item, "link").text = f"https://bits.alexalemi.com#{bit['id']}"

        # Build description
        description = bit.get("content", "")
        if bit.get("via"):
            description += f" (via {bit['via']})"
        ET.SubElement(item, "description").text = description or bit["title"]

        # GUID
        guid = ET.SubElement(item, "guid")
        guid.set("isPermaLink", "false")
        guid.text = f"bits-{bit['id']}"

        # Date
        if bit.get("date"):
            dt = datetime.strptime(bit["date"], "%Y-%m-%d")
            ET.SubElement(item, "pubDate").text = dt.strftime("%a, %d %b %Y 00:00:00 -0400")

        # Tags as categories
        for tag in bit.get("tags", []):
            ET.SubElement(item, "category").text = tag

    # Pretty print
    rough_string = ET.tostring(rss, encoding="unicode")
    reparsed = minidom.parseString(rough_string)
    pretty_xml = reparsed.toprettyxml(indent="  ")

    # Remove extra blank lines and fix declaration
    lines = [line for line in pretty_xml.split('\n') if line.strip()]
    xml_content = '\n'.join(lines)

    # Add stylesheet reference
    xml_content = xml_content.replace(
        '<?xml version="1.0" ?>',
        '<?xml version="1.0" encoding="UTF-8"?>\n<?xml-stylesheet type="text/xsl" href="assets/rss.xsl"?>'
    )

    output_path.write_text(xml_content)
    print(f"Generated {output_path}")


def main():
    root = Path(__file__).parent
    bits_json = root / "data" / "bits.json"
    template_dir = root / "templates"
    html_output = root / "bits.html"
    rss_output = root / "bits.xml"

    bits = load_bits(bits_json)

    if not bits:
        print("No bits found, generating empty pages")

    build_html(bits, template_dir, html_output)
    build_rss(bits, rss_output)


if __name__ == "__main__":
    main()
