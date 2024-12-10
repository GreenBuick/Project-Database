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

def addSale(totalPrice, orderDate, receiptDate, materialName, materialAmount, serviceKey, customerKey):
    return

def displaySales():
    return

def displayAccountMenu():
    print("--------------")
    print("1. Display Accounts")
    print("2. Register New Account")
    print("3. Return")
    print("Enter a number:")
    return

def createAccount(customerBalance="0", customerAddress="No address", customerPhoneNumber="No phone", customerEmail="No email"):
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

def purchaseService(serviceKey, materialAmount):
    return

def addService(serviceFee, servicePrice, optionalDescription="No description", equipmentKey=1):
    return

def removeService(serviceKey):
    return

def modifyService(serviceKey):
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

def addLocation(locationFee, locationName, materialName, materialAmountKG, serviceKey):
    return

def removeLocation(locationName):
    return

def modifyLocation(locationName, materialChange, feeChange=0):
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
