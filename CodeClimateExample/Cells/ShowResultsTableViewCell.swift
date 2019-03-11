import UIKit

class ShowResultsTableViewCell: UITableViewCell {
    weak var dateLabel: UILabel!
    weak var minTempLabel: UILabel!
    weak var maxTempLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let dateLabel = setUpDateLabel()
        contentView.addSubview(dateLabel)
        self.dateLabel = dateLabel
        
        let minTempLabel = setUpMinTempLabel()
        contentView.addSubview(minTempLabel)
        self.minTempLabel = minTempLabel
        
        let maxTempLabel = setUpMaxTempLabel()
        contentView.addSubview(maxTempLabel)
        self.maxTempLabel = maxTempLabel
        
        setUpConstraints(dateLabel: dateLabel, minTempLabel: minTempLabel, maxTempLabel: maxTempLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Mark: Extension on ShowResultsTableViewCell
extension ShowResultsTableViewCell {
    func setUpDateLabel() -> UILabel {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .preferredFont(forTextStyle: .title1)
        dateLabel.textColor = UIColor.black
        return dateLabel
    }
    
    func setUpMinTempLabel() -> UILabel {
        let minTempLabel = UILabel()
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.font = .preferredFont(forTextStyle: .title2)
        return minTempLabel
    }
    
    func setUpMaxTempLabel() -> UILabel {
        let maxTempLabel = UILabel()
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.font = .preferredFont(forTextStyle: .title2)
        return maxTempLabel
    }
    
    func setUpConstraints(dateLabel: UILabel, minTempLabel: UILabel, maxTempLabel: UILabel) {
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        maxTempLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10).isActive = true
        maxTempLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor, multiplier: 0.2).isActive = true
        minTempLabel.leadingAnchor.constraint(equalTo: maxTempLabel.trailingAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: minTempLabel.trailingAnchor, constant: 10).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        maxTempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        minTempLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 10).isActive = true
        contentView.bottomAnchor.constraint(equalTo: minTempLabel.bottomAnchor, constant: 10).isActive = true
    }
}
