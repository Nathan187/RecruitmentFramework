import Foundation
import UIKit
import BonMot

public protocol AuthenticateViewControllerDelegate : class  {
    func AddRemoveCredentials(store : Bool, username : String, password : String)
}

public class AuthenticateViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var swSaveCredentials: UISwitch!
    @IBOutlet weak var lblSaveCredentials: UILabel!
    
    public weak var delegate : AuthenticateViewControllerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var itms : [Composable] = []
        let styleHeader = StringStyle(.font(UIFont(name: "AvenirNext-Bold", size: 14)!), .color(.black))
        let styleDetail = StringStyle(.font(UIFont(name: "AvenirNext-Medium", size: 12.5)!), .color(.black))
        
        itms.append("Authenticate\n\n".styled(with: styleHeader))
        itms.append("Please enter your network credentials before proceeding.  This operation is idempotent.  You can perform a sync repeatedly.".styled(with: styleDetail))
        
        lblTitle.attributedText = NSAttributedString.composed(of: itms)
        lblSaveCredentials.attributedText = "Remember Credentials".styled(with: styleDetail)
         
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Provide functions to update view
    public func set(username text: String) {
        self.txtUsername.text = text
    }
    public func set(password text: String) {
        self.txtPassword.text = text
    }
    
    public func set(message attrString: NSAttributedString)
    {
        self.lblTitle.attributedText = attrString
    }

    public func set(messageBySwitch attrString : NSAttributedString)
    {
        self.lblSaveCredentials.attributedText = attrString
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
