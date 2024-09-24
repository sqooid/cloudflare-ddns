import os
from cloudflare import Cloudflare
import requests

zone_id = os.environ.get("CF_ZONE_ID") or ""
api_key = os.environ.get("CF_API_KEY") or ""
api_email = os.environ.get("CF_EMAIL") or ""
domain = os.environ.get("DOMAIN") or ""


def current_ip():
    return requests.get("https://api.ipify.org").text


def set_cf_ip(cf: Cloudflare, domain: str, ip: str):
    records = cf.dns.records.list(zone_id=zone_id)
    record_id = None
    for record in records:
        if record.name == domain:
            record_id = record.id
            break

    if record_id is None:
        print("Record not found")
        return

    print(f"Updating {domain} to {ip}")
    cf.dns.records.update(record_id, zone_id=zone_id, content=ip, name=domain, type="A")


if __name__ == "__main__":
    cf = Cloudflare(api_key=api_key, api_email=api_email)
    ip = current_ip()
    set_cf_ip(cf, domain, ip)
