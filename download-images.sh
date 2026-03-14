#!/usr/bin/env bash
# =============================================================================
# download-images.sh
# Downloads all Halle Mary Events site images from Squarespace CDN into the
# images/ subfolder with the filenames expected by index.html.
#
# Run from the repo root:
#   bash download-images.sh
# =============================================================================

set -euo pipefail

BASE="https://web.archive.org/web/20250307175529im_/https://images.squarespace-cdn.com/content/v1/674e2bbdce5c605f65fa41b9"
DEST="images"
mkdir -p "$DEST"

dl() {
  local url="$1"
  local out="$DEST/$2"
  echo "→ $2"
  curl -sL --fail --retry 3 -o "$out" "$url"
}

echo "Downloading Halle Mary Events images..."
echo ""

# ---------- Logo ----------
dl "${BASE}/366fd141-3d7f-4d28-9f6d-655b199de21a/Halle+Mary+Main+Logo+2400x1800.png" \
   "logo-main.png"

# ---------- Hero ----------
dl "${BASE}/e7cc6065-1981-4542-8dba-877e15d3c5b0/2024_Blueprints-_-Blue-Jeans-1181-Pano-highlights_1920pixels.jpg" \
   "hero-bg.jpg"

# ---------- Service images ----------
# Raffle & Auction Direction – outdoor Habitat for Humanity event
dl "${BASE}/497aec69-5e4c-4115-871d-47ab4d3c7431/IMG_0513.jpg" \
   "service-raffle.jpg"

# Fundraising Strategy – gala auction scene
dl "${BASE}/eaa2ba79-6653-4653-bc8f-4cf59c6f8376/241109_GA_387.jpg" \
   "service-fundraising.jpg"

# Decor & Styling Advisement – elegant table setting
dl "${BASE}/7fac6427-80b6-4d22-966e-bfb3e059c88e/4J3A0409.jpg" \
   "service-decor.jpg"

# Audio/Visual Guidance – speaker on stage
dl "${BASE}/7d8b9bf8-22c3-4aa3-8d6e-f910262a145c/2024_Blueprints-_-Blue-Jeans-1148-highlights.jpg" \
   "service-av.jpg"

# ---------- About – Mary Hetrick photos ----------
dl "${BASE}/2bddad35-9434-4930-b42a-6d38506f03f8/Mary-0724_1+2024-12-10+21_01_18.jpg" \
   "mary-headshot.jpg"

dl "${BASE}/8dd5215c-b371-475e-b784-939181c0ab98/IMG_5634.jpg" \
   "mary-golf.jpg"

dl "${BASE}/83bcf9ad-7df0-44ee-a75b-80cb3891156b/IMG_4233.jpg" \
   "mary-torch.jpg"

dl "${BASE}/ba46b3e7-8b51-443f-8ae7-29882e2a827b/IMG_3721.jpg" \
   "mary-mayor.jpg"

# ---------- Nonprofit logos ----------
dl "${BASE}/24653315-f6f5-44b5-b136-98bd4f23de93/1711839927318.jpg" \
   "logo-habitat.jpg"

dl "${BASE}/a3380cdc-ff73-4cb3-aed7-e9969249f458/Gabriels-Angels-Logo-1200-x-630.jpg" \
   "logo-gabriels-angels.jpg"

dl "${BASE}/b10398c3-f6fa-48bb-913c-0f367e765f40/AHS_NewLogo_Vertical_RGB-square.png" \
   "logo-arizona-humane.png"

dl "${BASE}/ebe539a8-c4e5-47f7-98bc-227fd05a76da/sKXBFLx9zrbGHupYDYGaKFRZjlgjkW1vUvr6U3sk.jpg" \
   "logo-phoenix-rising.jpg"

dl "${BASE}/c0f2c592-f2d3-4169-b6b6-2ddc0fa08fba/SOAZ-Logo-1-4.png" \
   "logo-special-olympics.png"

dl "${BASE}/bfda8a0f-7663-49a9-b4c8-5b1612c37e97/V8JtjEwR_400x400.jpg" \
   "logo-tenet.jpg"

dl "${BASE}/b3e59d56-d1b2-4886-88da-8f435eed6cfe/HonorHealth-Foundation-logo-2020-final-vertical-purple-gold_600px.png" \
   "logo-honorhealth.png"

dl "${BASE}/acceee2a-ac43-4593-a653-b4d849301f9c/Untitled+design%282%29.png" \
   "logo-ceces-hope.png"

echo ""
echo "Done! All images saved to images/"
echo ""
echo "Next steps:"
echo "  git add images/"
echo "  git commit -m 'Add downloaded images'"
echo "  git push"
