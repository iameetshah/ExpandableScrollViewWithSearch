//
//  MenuView.swift
//  ExpandableScrollViewWithSearch
//
//  Created by Mit Shah on 27/03/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing:Bool
    
    var body: some View {
        HStack {
            TextField("Search in sub header eg.'5' shows header 2 ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.gray)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel").font(.system(size: 16)).foregroundColor(Color.primary)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct MenuView: View {
    var dismiss: (() -> Void)?
    @State private var searchText = ""
    var headerItem:[HeaderItem] = MenuItems.sample
    @State var isEditing:Bool = false
    @State var selectedItem:SubHeaderItem?
    @State var selectedHeader:HeaderItem?
    var body: some View {
        searchableView
        scrollForEach
    }
    
    var scrollForEach: some View {
        ScrollView {
            ForEach(searchText.isEmpty ? headerItem : menuFilter()) { header in
                SubMenuView(header: header,selectedItem: $selectedItem, selectedHeader: $selectedHeader,isExpanded: false, searchText: searchText)
                    .modifier(ListRowModifier())
                    .animation(.linear(duration: 0.3))
            }
        }
       
    }
    var searchableView: some View {
        VStack(alignment: .leading) {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Text("Display data for")
                .font(.system(size: 16)).foregroundColor(Color.gray)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
            Divider()
        }
        
    }
    private func menuFilter() -> [HeaderItem] {
        return headerItem.filter { (header) -> Bool in
            for subHeader in header.subHeader {
                if subHeader.name.lowercased().contains(searchText.lowercased()) {
                    return true
                }
            }
            return false
        }
    }
}


struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }
    }
}
#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
