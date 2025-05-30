import os
import shutil

class ScreenshotMover:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        self.screenshot_dir = os.path.join("results", "screenshots", "screenshot")
        os.makedirs(self.screenshot_dir, exist_ok=True)

    def log_message(self, message):
        # 🔍 DEBUG PRINT
        print("log_message CALLED")
        print("message.html:", message.html)

        if message.html and "src=" in message.html:
            start = message.html.find('src="') + 5
            end = message.html.find('"', start)
            screenshot_path = message.html[start:end]

            print("SCREENSHOT PATH:", screenshot_path)  # ✅ ตรวจ path ที่ extract ได้

            if os.path.exists(screenshot_path):
                dest_path = os.path.join(self.screenshot_dir, os.path.basename(screenshot_path))
                print(f"Moving {screenshot_path} → {dest_path}")  # ✅ แจ้งว่ากำลังย้ายไฟล์
                shutil.move(screenshot_path, dest_path)
            else:
                print("❌ Screenshot path does not exist:", screenshot_path)
