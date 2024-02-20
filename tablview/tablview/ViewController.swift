import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,SecondViewControllerDelegate  {

    @IBOutlet weak var tableView: UITableView!

    @IBAction func addButtonTapped(_ sender: UIButton) {
        presentNextViewController()
    }
    func presentNextViewController() {
            // Assuming you are presenting NextViewController from ViewController
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

            // Set ViewController as the delegate of NextViewController
            nextVC.delegate = self

            // Present or push NextViewController
            navigationController?.pushViewController(nextVC, animated: true)
            // Or: present(nextVC, animated: true, completion: nil)
        }
     var dummyData: [[String: String]] = [
            ["task": "Demotask", "description": "Demodescrption"],
            
        ]
    

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.delegate = self
            
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from your data source
            dummyData.remove(at: indexPath.row)

            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue", let indexPath = tableView.indexPathForSelectedRow {
            let selectedData = dummyData[indexPath.row]
           
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.detailData = selectedData
            }
        }
    }


    func didAddData(task: String, description: String) {
            // Handle the received data, for example, update your data source and reload the table view
            dummyData.append(["task": task, "description": description])
            tableView.reloadData()
        }


        // MARK: - UITableViewDataSource methods

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dummyData.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
            let person = dummyData[indexPath.row]
            if let name = person["task"], let description = person["description"] {
                cell.textLabel?.text = "Task: \(name), Description: \(description)"
            }
            return cell
        }
    }
