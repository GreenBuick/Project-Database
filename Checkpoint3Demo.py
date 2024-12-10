import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):
    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
    except Error as e:
        print(e)
    return conn

def closeConnection(_conn, _dbFile):
    try:
        _conn.close()
    except Error as e:
        return
    
# Print menu with options: create account, view services, view accounts, add new services, remove old services, view sales, modify locations, purchase services
# Menu will have a few options, 1. Accounts 2. Services 3. Locations 4. Equipment 5. View Sales 6. View Materials
def displayMenu():
    print("--------------")
    print("1. Accounts")
    print("2. Services")
    print("3. Locations")
    print("4. Equipment")
    print("5. View Sales")
    print("6. View Materials")
    print("Enter a number:")
    return

def displayAccountMenu():
    print("--------------")
    print("1. Display Accounts")
    print("2. Register New Account")
    print("3. Return")
    print("Enter a number:")
    return

def createAccount():
    return

def viewAccounts():
    return

def displayServiceMenu():
    print("--------------")
    print("1. Display Services")
    print("2. Purchase Services")
    print("3. Add Services")
    print("4. Remove Services")
    print("5. Modify Services")
    print("Enter a number:")
    return

def displayServices():
    return

def purchaseServices():
    return

def addService():
    return

def removeService():
    return

def modifyService():
    return
    
def displayLocationMenu():
    print("--------------")
    print("1. Display Locations")
    print("3. Add Locations")
    print("4. Remove Locations")
    print("5. Modify Locations")
    print("Enter a number:")
    return

def displayLocations():
    return

def addLocation():
    return

def removeLocation():
    return

def modifyLocation():
    return

def main():
    database = r"Checkpoint2-dbase.sqlite3"

    # create a database connection
    conn = openConnection(database)
    
    while(True):
        displayMenu()
        break

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
