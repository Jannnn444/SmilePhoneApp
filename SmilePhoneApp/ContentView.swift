//
//  ContentView.swift
//  SmilePhoneApp
//
//  Created by Hualiteq International on 2025/8/8.
//

import SwiftUI

// MARK: - Content View (Root)
struct ContentView: View {
    var body: some View {
        NavigationView {
            GreetingView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Greeting/Welcome Screen
struct GreetingView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("😄")
                .font(.system(size: 80))
            
            Text("Hi, Welcome Smile Phone App")
                .font(.system(size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
            
            NavigationLink(destination: LoginView()) {
                Text("Continue")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

// MARK: - Login Screen with Account/Password Fields
struct LoginView: View {
    @State private var account = ""
    @State private var password = ""
    @State private var navigateToHome = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Log In")
                .font(.system(size: 24, weight: .medium))
                .padding(.top, 40)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Account")
                        .font(.system(size: 20, weight: .medium))
                    
                    TextField("Enter your account", text: $account)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.system(size: 20, weight: .medium))
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding(.horizontal, 20)
            
            Button(action: {
                handleLogin()
            }) {
                Text("Go")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .disabled(account.isEmpty || password.isEmpty)
            
            NavigationLink(destination: ForgotPasswordView()) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }
            
            Spacer()
            
            NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                EmptyView()
            }
        }
        .navigationTitle("Log In")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Login Failed", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text("Please check your account and password.")
        }
    }
    
    private func handleLogin() {
        // Simple validation - in real app, this would be actual authentication
        if !account.isEmpty && !password.isEmpty {
            navigateToHome = true
        } else {
            showAlert = true
        }
    }
}

// MARK: - Forgot Password Screen
struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var navigateToConfirmation = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Send password to your email")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.top, 40)
            
            TextField("Enter your email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding(.horizontal, 20)
            
            Button(action: {
                navigateToConfirmation = true
            }) {
                Text("Send")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
            
            NavigationLink(destination: PasswordSentView(), isActive: $navigateToConfirmation) {
                EmptyView()
            }
        }
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Password Sent Confirmation
struct PasswordSentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("Your password (that been sent to your email) !")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Button(action: {
                // Navigate back to root
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("OK !")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 44)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .navigationTitle("Password Sent")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Home Screen with Tab Navigation
struct HomeView: View {
    @State private var selectedTab = 0
    
    private let sampleContacts = [
        Contact(name: "John", phoneNumber: "123456789"),
        Contact(name: "Alice", phoneNumber: "987654321"),
        Contact(name: "Bob", phoneNumber: "123456788"),
        Contact(name: "Carol", phoneNumber: "333333333")
    ]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DialerView()
                .tabItem {
                    Image(systemName: "phone.circle.fill")
                    Text("Dialer")
                }
                .tag(0)
                
            
            FavoritePageView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorite")
                }
                .tag(1)
               
            
            ContactPageView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Contacts")
                }
                .tag(2)
               
            
            RecentCallsView(contacts: sampleContacts)
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Recent")
                }
                .tag(3)
               
            
            PersonalPageView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
                .tag(4)
               
        }
//        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Dialer View for Making Calls
struct DialerView: View {
    @State private var phoneNumber = ""
    @State private var showCallAlert = false
    
    private let buttonTitles = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["*", "0", "#"]
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Hi, Dear Janus Welcome Smile Home")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            // Phone Number Display
            VStack(spacing: 10) {
                Text("Phone Number")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.secondary)
                
                Text(phoneNumber.isEmpty ? "Enter number" : phoneNumber)
                    .font(.system(size: 32, weight: .medium, design: .monospaced))
                    .foregroundColor(phoneNumber.isEmpty ? .secondary : .primary)
                    .frame(minHeight: 40)
            }
            .padding(.horizontal, 20)
            
            // Dialer Keypad
            VStack(spacing: 15) {
                ForEach(0..<buttonTitles.count, id: \.self) { rowIndex in
                    HStack(spacing: 20) {
                        ForEach(0..<buttonTitles[rowIndex].count, id: \.self) { columnIndex in
                            let title = buttonTitles[rowIndex][columnIndex]
                            
                            Button(action: {
                                phoneNumber += title
                            }) {
                                Text(title)
                                    .font(.system(size: 28, weight: .medium))
                                    .foregroundColor(.primary)
                                    .frame(width: 75, height: 75)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(37.5)
                            }
                        }
                    }
                }
            }
            
            // Action Buttons
            HStack(spacing: 30) {
                // Delete Button
                Button(action: {
                    if !phoneNumber.isEmpty {
                        phoneNumber.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.red)
                        .frame(width: 60, height: 60)
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(30)
                }
                .disabled(phoneNumber.isEmpty)
                
                // Call Button
                Button(action: {
                    makeCall()
                }) {
                    Image(systemName: "phone.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .frame(width: 75, height: 75)
                        .background(Color.green)
                        .cornerRadius(37.5)
                }
                .disabled(phoneNumber.isEmpty)
                
                // Clear Button
                Button(action: {
                    phoneNumber = ""
                }) {
                    Image(systemName: "clear.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.orange)
                        .frame(width: 60, height: 60)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(30)
                }
                .disabled(phoneNumber.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .alert("Calling...", isPresented: $showCallAlert) {
            Button("End Call") { }
        } message: {
            Text("Calling \(phoneNumber)")
        }
    }
    
    private func makeCall() {
        showCallAlert = true
        // In a real app, this would initiate an actual phone call
        // using CallKit or similar framework
    }
}

// MARK: - Favorite Page
struct FavoritePageView: View {
    let contacts: [Contact]
    
    var body: some View {
        VStack {
            Text("Favorite Page")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            List(contacts) { contact in
                ContactRowView(contact: contact)
            }
        }
    }
}

// MARK: - Contact Page
struct ContactPageView: View {
    let contacts: [Contact]
    
    var body: some View {
        VStack {
            Text("Contact Book")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            List(contacts) { contact in
                ContactRowView(contact: contact)
            }
        }
    }
}

// MARK: - Recent Calls Page
struct RecentCallsView: View {
    let contacts: [Contact]
    
    var body: some View {
        VStack {
            Text("Recent Calls")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            List(contacts) { contact in
                ContactRowView(contact: contact)
            }
        }
    }
}

// MARK: - Personal Profile Page
struct PersonalPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let user = User(
        firstName: "Janus",
        lastName: "Huang",
        account: "janus@gmail.com",
        registeredDate: "2025/08/01"
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Personal Information")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                VStack(spacing: 20) {
                    ProfileInfoView(title: "Name", value: user.firstName)
                    ProfileInfoView(title: "Last Name", value: user.lastName)
                    ProfileInfoView(title: "Account", value: user.account)
                    ProfileInfoView(title: "Password", value: "●●●●●●●●●●")
                    ProfileInfoView(title: "Registered Date", value: user.registeredDate)
                }
                .padding(.horizontal, 20)
                
                Button(action: {
                    // Navigate back to root (logout)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
    }
}

// MARK: - Contact Row Component
struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(.system(size: 20, weight: .medium))
                
                Text(contact.phoneNumber)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Profile Info Component
struct ProfileInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 20))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GreetingView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct DialerView_Previews: PreviewProvider {
    static var previews: some View {
        DialerView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
