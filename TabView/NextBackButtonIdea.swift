                VStack{
                    Spacer()
                    HStack {
                        Button(action: {
                            if page > 0 {
                                withAnimation { page -= 1 }
                            }
                        }, label: {
                            Image(systemName: "chevron.backward")
                        })
                        .font(.title)
                        .foregroundColor(.gray)
                        .offset(x:geometry.safeAreaInsets.bottom)

                        Spacer()
                        
                        Button(action: {
                            if page < 8 {
                                withAnimation { page += 1 }
                            }
                        }, label: {
                            Image(systemName: "chevron.forward")
                        })
                        .font(.title)
                        .foregroundColor(.gray)
                        .offset(x:-geometry.safeAreaInsets.bottom)
                        
                    }
                }
