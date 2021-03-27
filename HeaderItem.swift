//
//  HeaderItem.swift
//  ExpandableScrollViewWithSearch
//
//  Created by Mit Shah on 27/03/21.
//

import Foundation

struct HeaderItem :Identifiable, Equatable {
    let id:Int
    let name:String
    let details:String
    let subHeader:[SubHeaderItem]
    static func == (lhs: HeaderItem, rhs: HeaderItem) -> Bool {
        lhs.name == rhs.name && lhs.id == rhs.id
    }
}
struct SubHeaderItem:Identifiable, Equatable{
    let id:Int
    let name:String
    let otherPropery:String
}
struct MenuItems:Identifiable {
    let id:Int
    static let sample = [HeaderItem(id: 0,
                                    name: "Header Item 1",
                                    details: "This is header item 1",
                                    subHeader: [SubHeaderItem(id: 0, name: "Sub Header Item 1", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 1, name: "Sub Header Item 2", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 2, name: "Sub Header Item 3", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 3, name: "Sub Header Item 4", otherPropery: "This is some other property")]),
                         HeaderItem(id: 1,
                                    name: "Header Item 2",
                                    details: "This is header item 2",
                                    subHeader: [SubHeaderItem(id: 4, name: "Sub Header Item 4", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 5, name: "Sub Header Item 5", otherPropery: "This is some other property")]),
                         HeaderItem(id: 2,
                                    name: "Header Item 3",
                                    details: "This is header item 3",
                                    subHeader: [SubHeaderItem(id: 6, name: "Sub Header Item 6", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 7, name: "Sub Header Item 7", otherPropery: "This is some other property"),
                                                SubHeaderItem(id:8, name: "Sub Header Item 8", otherPropery: "This is some other property"),
                                                SubHeaderItem(id: 9, name: "Sub Header Item 9", otherPropery: "This is some other property")]),
                         HeaderItem(id: 3,
                         name: "Header Item 4",
                         details: "This is header item 4",
                         subHeader: [SubHeaderItem(id: 10, name: "Sub Header Item 1", otherPropery: "This is some other property"),
                         SubHeaderItem(id: 11, name: "Sub Header Item 2", otherPropery: "This is some other property"),
                         SubHeaderItem(id: 12, name: "Sub Header Item 3", otherPropery: "This is some other property"),
                         SubHeaderItem(id: 13, name: "Sub Header Item 4", otherPropery: "This is some other property")])]
    static let selectedHeader = sample[0]
    static let selectedItem = sample[0].subHeader[0]
}
