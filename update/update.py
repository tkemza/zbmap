import subprocess
import os

def installudpt():
    try:
        # Update package list
        subprocess.run(['sudo', 'apt-get', 'update', '-y'], check=True)    
        subprocess.run(['sudo', 'apt-get', 'upgrade', '-y'], check=True) 

        print("Update has been installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    installudpt()