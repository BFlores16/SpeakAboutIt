//
//  HideViewModifier.swift
//  SpeakAboutIt
//
//  Created by Brando Flores on 8/12/22.
//

import SwiftUI

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func HideView(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

/*
 3
 If used to hide an object in a Form, it will still show a tappable blank view. –
 atulkhatri
  Dec 14, 2019 at 19:08
 1
 This is great! Have you published this anywhere? I'd love to share it but it's odd sharing a StackOverflow answer instead of a code repo. –
 Ky.
  Jan 15, 2020 at 4:37
 1
 @BenLeggiero It can now be found here. –
 George
  Jan 15, 2020 at 8:26
 @atulkhatri if you want to completely remove the view, you can edit the body function to return an EmptyView() in the group instead of the content. I would like to suggest this as minor tweak/flag for the modifier as wel @George_E. –
 Bram
  Feb 18, 2020 at 14:36
 Is this possible to animate? –
 Antony Stubbs
  Jun 29, 2020 at 7:55
 @AntonyStubbs Yes! Where you toggle the value for if the content is hidden, you wrap it in withAnimation. E.g. in a button: withAnimation { hidden.toggle() }. –
 George
  Jun 29, 2020 at 8:44
 Thanks @George_E! I've also discovered that if you do indeed wrap the view in a simple conditional statement as in @Jake's answer, you can apply animation modifier to the property binding is in the conditional and it will actually animate as well. See here: hackingwithswift.com/quick-start/swiftui/… –
 Antony Stubbs
  Jun 29, 2020 at 9:23
 @JarWarren I don’t know much about licences, but you are completely free to use this code and always will be –
 George
  Oct 25, 2020 at 10:15
 */
