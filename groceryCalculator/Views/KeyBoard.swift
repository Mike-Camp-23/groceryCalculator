//
//  KeyBoard.swift
//  groceryCalculator
//
//  Created by Michael Camp on 6/9/21.
//

import SwiftUI

struct KeyBoard: View {
    //MARK: - Properties and Bindings
    @ObservedObject var data: MasterData
    
//    @Binding var output: String

    @State var compressedKeyboard: Bool
    @State var preferedLeftSpace: Bool
    var isBudgetKeyBoard: Bool
    var ipad: Bool {
        if UIDevice.current.localizedModel == "iPad" {
            return true
        } else {
            return false
        }
    }
    var addPressed = {}
    var minusPressed = {}
    
    //MARK: - Funcitons
    func zeroButton(isBudgetKeyboard budget: Bool) {
        if budget {
            if data.currentBudgetString == "" {
                return
            } else {
                data.currentBudgetString.append("0")
            }
        } else {
            if data.currentString == "" {
                return
            } else {
                data.currentString.append("0")
            }
        }
    }
    func backSpace(isBudgetKeyboard budget: Bool) {
        if budget {
            if data.currentBudgetString.count == 0 {
                return
            } else {
                data.currentBudgetString.removeLast()
                }
            }
            else {
                if data.currentString.count == 0 {
                    return
                } else {
                    data.currentString.removeLast()
                }
        }
    }
    func removeAll(isBudgetKeyboard budget: Bool) {
        if budget {
            if data.currentBudgetString.count == 0 {
                return
            } else {
                data.currentBudgetString.removeAll()
            }
        } else {
            if data.currentString.count == 0 {
                return
            } else {
                data.currentString.removeAll()
            }
        }
    }
    
    var body: some View {
        
        HStack {
            if compressedKeyboard && preferedLeftSpace && !ipad {
                VStack {
                    Button(action: {
                    withAnimation {preferedLeftSpace.toggle()
                    }}) {
                        Image(systemName: "arrow.left.arrow.right")
//                            .frame(width: 50, height: 75)
                            .foregroundColor(.secondary)
                            .font(.title)
                            
                    }
                    Divider()
                        .frame(width: 40)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "arrow.up")
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                  
                }
                .frame(height: 205)
                .background(Color("ButtonColor"))
                .cornerRadius(15)
                
               
                .padding(20)
                
                .clipShape(RoundedRectangle(cornerRadius: 15))
                    
            }
                
            
            
            
            
            GeometryReader { geo in
            VStack(spacing: 5) {
               
                //MARK: - Top Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("7") : data.currentString.append("7")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("7")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("8") : data.currentString.append("8")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("8")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("9") : data.currentString.append("9")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("9")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        backSpace(isBudgetKeyboard: isBudgetKeyBoard)
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            .background(Color.white).cornerRadius(10)
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Image(systemName: "delete.left"))
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                }
                .padding(.top, 5)
                
                //MARK: - Second Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {

                        isBudgetKeyBoard ? data.currentBudgetString.append("4") : data.currentString.append("4")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("4")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("5") : data.currentString.append("5")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("5")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("6") : data.currentString.append("6")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("6")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {

                        removeAll(isBudgetKeyboard: isBudgetKeyBoard)
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            .background(Color.white).cornerRadius(10)
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("AC"))
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                }
                
                //MARK: - Third Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("1") : data.currentString.append("1")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("1")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {

                        isBudgetKeyBoard ? data.currentBudgetString.append("2") : data.currentString.append("2")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("2")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.currentBudgetString.append("3") : data.currentString.append("3")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("3")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        isBudgetKeyBoard ? data.budgetMinusPressed() : data.minusPressed()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            
                            .frame(width: (geo.size.width - 25) / 4, height: 45, alignment: .center)
                            .overlay(Text("-")
                                        .fontWeight(.bold))
                            .font(.title)
                            
                            .foregroundColor(isBudgetKeyBoard ? .gray : .primary)
                    })

                }
                
                //MARK: - Fourth Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                      zeroButton(isBudgetKeyboard: isBudgetKeyBoard)
                      
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))

                            .frame(width: (geo.size.width - 15) / 2, height: 45, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("0")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        
                        isBudgetKeyBoard ? data.returnPressed() : data.plusPressed()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            
                            .foregroundColor(Color("ControlButtonColor"))
                            .frame(width: (geo.size.width - 15) / 2, height: 45, alignment: .center)
                            .overlay(Image(systemName: isBudgetKeyBoard ? "return" : "plus"))
                                        .font(.title)
                            .foregroundColor(.primary)
                    })
                }
                .padding(.bottom, 5)
            }
            }
            
            if compressedKeyboard && !preferedLeftSpace && !ipad {
               Button(action: {
                withAnimation {preferedLeftSpace.toggle()
                }}) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                        .frame(width: 50, height: 75)
                        .font(.title)
                }
                
                    
            }
                
        } .frame(height: 205)
        .frame(idealWidth: ipad ? 350 : 400, maxWidth: ipad ? 300 : 450)
    }
}

struct KeyBoard_Previews: PreviewProvider {
   @State static var string = ""
    @ObservedObject var master: MasterData
    static var previews: some View {
       
        KeyBoard(data: MasterData(), compressedKeyboard: true, preferedLeftSpace: true, isBudgetKeyBoard: true)
            .previewLayout(.sizeThatFits)
            .background(Color("GreenColorSet"))
            .preferredColorScheme(.light)
    }
}


