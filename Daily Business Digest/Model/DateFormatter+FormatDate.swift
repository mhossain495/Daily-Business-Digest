//
//  DateFormatter+FormatDate.swift
//  Daily Business Digest
//
//  Created by Mohammed Hossain on 3/9/21.
//

import Foundation

extension DateFormatter {
    
    func formatDate(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        // ISO 8601 date format from API
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        // Fixed date formatting
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        // Format API date to new format with date and time
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "MMM dd, yyyy 'at' h:mm a"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
