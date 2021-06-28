//
//  ButtonView.swift
//  groceryCalculator
//
//  Created by Michael Camp on 5/13/21.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        
        GeometryReader { geo in
            VStack(spacing: 5) {
                Spacer()
                //MARK: - Top Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        print("append 7")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("7")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        
                        print("append 8")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("8")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("append 9")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("9")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("backspace")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            .background(Color.white).cornerRadius(10)
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Image(systemName: "delete.left"))
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                }
                .padding(.top, 5)
                
                //MARK: - Second Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        print("append 4")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("4")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        
                        print("append 5")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("5")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("append 6")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("6")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("clear all")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            .background(Color.white).cornerRadius(10)
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("AC"))
                            .font(.title)
                            .foregroundColor(.primary)
                    })

                }
                
                //MARK: - Third Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        print("append 1")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("1")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        
                        print("append 2")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("2")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("append 3")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("3")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                    })
                    Button(action: {
                        print("minus")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ControlButtonColor"))
                            
                            .frame(width: (geo.size.width - 25) / 4, height: 50, alignment: .center)
                            .overlay(Text("-")
                                        .fontWeight(.bold))
                            .font(.title)
                            
                            .foregroundColor(.primary)
                    })

                }
                
                //MARK: - Fourth Row Buttons
                
                HStack(alignment: .center, spacing: 5) {
                  
                    Button(action: {
                        print("append 0")
                        
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("ButtonColor"))
                            .background(Color(.white).cornerRadius(10))
//                            .shadow(radius: 10)
                            .frame(width: (geo.size.width - 15) / 2, height: 50, alignment: .center)
                            .padding(.leading, 5)
                            .overlay(Text("0")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                            
                        
                    })
                    Button(action: {
                        
                        print("plus")
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            
                            .foregroundColor(Color("ControlButtonColor"))
                            .frame(width: (geo.size.width - 15) / 2, height: 50, alignment: .center)
                            .overlay(Text("+")
                                        .font(.title)
                                        .fontWeight(.bold))
                            .foregroundColor(.primary)
                        
                    })
                    

                }
                .padding(.bottom, 5)
               
            }
//            .background(Color("GreenColorSet"))
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
            .background(Color("GreenColorSet"))
    }
}



struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("GreenColorSet"))
    }
}
