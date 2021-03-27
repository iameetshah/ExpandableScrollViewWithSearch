//
//  SubMenuView.swift
//  ExpandableScrollViewWithSearch
//
//  Created by Mit Shah on 27/03/21.
//

import SwiftUI

struct SubMenuView: View {
    let header: HeaderItem
    @Binding var selectedItem:SubHeaderItem?
    @Binding var selectedHeader:HeaderItem?
    @State var isExpanded: Bool
    let searchText: String
    var body: some View {
        HStack {
            content
            Spacer()
        }
        .contentShape(Rectangle())
    }
    private var content: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(header.name)
                    .font(.system(size: 16))
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .frame(height:30)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                Spacer()
                Image("arrow_expand").rotationEffect(.degrees(isExpanded ? 90 : 270))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .contentShape(Rectangle())
            .onTapGesture {
                isExpanded.toggle()
            }
            
            if isExpanded {
                if let filteredSubItems = searchText.isEmpty ? header.subHeader : header.subHeader.filter({ (subHeader) -> Bool in
                    subHeader.name.lowercased().contains(searchText.lowercased())
                }) {
                    VStack(alignment: .leading) {
                        if filteredSubItems.count > 1 {
                            Divider()
                            HStack {
                                Text("Select all").font(.system(size: 16)).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                Spacer()
                                Image(selectedHeader == header ? "RadioChecked" : "RadioUnchecked")
                            }
                            .frame(height:30)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing:0))
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedItem = nil
                                selectedHeader = header
                            }
                        }
                        ForEach(filteredSubItems) { subHeader in
                            Divider()
                            HStack {
                                Text(subHeader.name)
                                    .truncationMode(.tail)
                                    .lineLimit(1)
                                    .font(.system(size: 16)).padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                Spacer()
                                
                                Image(selectedItem == subHeader ? "RadioChecked" : "RadioUnchecked")
                            }
                            .frame(height:30)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedItem = subHeader
                                selectedHeader = nil
                            }
                        }
                    }
                }
            }
        }
    }
    
}
#if DEBUG
struct SubMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SubMenuView(header: MenuItems.sample[0],selectedItem: .constant(nil), selectedHeader: .constant(MenuItems.selectedHeader), isExpanded: false, searchText: "")
    }
}
#endif
