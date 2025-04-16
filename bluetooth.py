import time

# Simulated Bluetooth Device List
bluetooth_devices = [
    {"name": "JBL TUNE 510BT", "address": "00:1A:7D:DA:71:13"},
    {"name": "boAt Rockerz 255", "address": "00:1A:7D:DA:71:14"},
    {"name": "Sony WH-1000XM4", "address": "00:1A:7D:DA:71:15"},
]

def scan_devices():
    print("🔍 Scanning for Bluetooth devices...")
    time.sleep(2)
    for device in bluetooth_devices:
        print(f"📡 Found device: {device['name']} ({device['address']})")
    return bluetooth_devices

def connect_to_device(device):
    print(f"\n🔗 Connecting to {device['name']}...")
    time.sleep(2)
    print("✅ Connection successful!")
    return True

def play_meditation_music():
    print("\n🎵 Now playing: 'Calm Waves - Zen Sounds'")
    time.sleep(1)
    print("🎧 Audio is being played through connected Bluetooth device.")
    time.sleep(3)
    print("✨ Relax, Breathe, and Meditate...")

# Main simulation flow
if __name__ == "__main__":
    print("🧘 Meditation App - Bluetooth Music Playback Simulation 🧘\n")
    available_devices = scan_devices()

    if available_devices:
        selected_device = available_devices[1]  # Selecting the second device for demo
        success = connect_to_device(selected_device)

        if success:
            play_meditation_music()
        else:
            print("❌ Failed to connect to the Bluetooth device.")
    else:
        print("⚠️ No Bluetooth devices found.")
