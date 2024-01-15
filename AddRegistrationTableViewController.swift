//
//  AddRegistrationTableViewController.swift
//  hotelbooking
//
//  Created by Sai Rohit on 11/01/24.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, selectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        
        self.roomType = roomType
        updateRoomType()
    }
    var registration: Registration{
        guard let roomType = roomType else{ return nil}
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkinDate = checkinDatePicker.date
        let checkoutDate = checkoutDatePicker.date
        
        let numberOfAdultsCount = Int(numberOfAdultsStepper.value)
        let numberOfChildrenCount = Int(numberOfChildrenStepper.value)
        
        let hasWiFi = wifiSwitch.isOn
        return Registration(firstName: firstName, lastName: lastName, email: email, checkInDate: checkinDate, checkOutDate: checkoutDate, numberOfAdults: numberOfAdultsCount, numberOfChildren: numberOfChildrenCount, wifi: hasWiFi, roomType: roomType)
    }
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkinDateLabel: UILabel!
    
    @IBOutlet weak var checkinDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkoutDateLabel: UILabel!
    
    @IBOutlet weak var checkoutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    let checkinDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    let checkoutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkinDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    
    let checkoutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckinDatePickerVisibile: Bool = false {
        didSet {
            checkinDatePicker.isHidden = !isCheckinDatePickerVisibile
        }
    }
    var roomType: RoomType?
    var isCheckoutDatePickerVisible: Bool  = false {
        didSet {
            checkoutDatePicker.isHidden = !isCheckoutDatePickerVisible
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumberOfGuests()
        updateDateViews()
        updateRoomType()
        let midNightToday = Calendar.current.startOfDay(for: Date())
        
        checkinDatePicker.minimumDate = midNightToday
       
//        checkoutDatePicker.minimumDate = midNightToday + 1

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
        }
        else{
            roomTypeLabel.text = "not set"
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerCellIndexPath where isCheckinDatePickerVisibile == false:
            return 0
            
        case checkoutDatePickerCellIndexPath where isCheckoutDatePickerVisible == false:
            return 0
            
        default:
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkinDatePickerCellIndexPath:
            return 190
            
        case checkoutDatePickerCellIndexPath:
            return 190
        
        default:
            return UITableView.automaticDimension
        }
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkinDate = checkinDatePicker.date
        let checkoutDate = checkoutDatePicker.date
        
        let numberOfAdultsCount = Int(numberOfAdultsStepper.value)
        let numberOfChildrenCount = Int(numberOfChildrenStepper.value)
        
        let hasWiFi = wifiSwitch.isOn
        
        print("Done Button Tapped")
        print("First Name: \(firstName) Last Name: \(lastName) Email: \(email)")
        
        print("Checkin: \(checkinDate), Checkout: \(checkoutDate)")
        
        print("No. of Adults: \(numberOfAdultsCount), No. of Children: \(numberOfChildrenCount)")
        
        print("Wi–Fi: \(hasWiFi)")
    }
    
//    checkinDateLabel.text = checkinDate.date
//    checkoutDateLabel.text = checkoutDate.date
    
    func updateDateViews() {
        checkoutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkinDatePicker.date)
        
        checkinDateLabel.text = checkinDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkoutDateLabel.text = checkoutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        updateDateViews()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == checkinDateLabelCellIndexPath && isCheckoutDatePickerVisible == false {
            isCheckinDatePickerVisibile.toggle()
        } else  if indexPath == checkoutDateLabelCellIndexPath && isCheckinDatePickerVisibile == false {
            isCheckoutDatePickerVisible.toggle()
        } else if indexPath == checkinDateLabelCellIndexPath || indexPath == checkoutDateLabelCellIndexPath {
            isCheckinDatePickerVisibile.toggle()
            isCheckoutDatePickerVisible.toggle()
        } else {
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
            updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
               selectRoomTypeController?.delegate = self
               selectRoomTypeController?.roomType = roomType
               return selectRoomTypeController
    }
}
