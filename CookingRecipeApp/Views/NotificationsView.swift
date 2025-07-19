//
//  NotificationsView.swift
//  CookingRecipeApp
//
//  Created by Sujith Antony on 19/06/24.
//

import SwiftUI

struct NotificationsView: View {
    @State private var notifications: [NotificationItem] = sampleNotifications
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notifications) { notification in
                    NotificationRow(notification: notification)
                }
                .onDelete(perform: deleteNotification)
            }
            .navigationTitle("Notifications")
            .listStyle(PlainListStyle())
        }
    }
    
    private func deleteNotification(offsets: IndexSet) {
        notifications.remove(atOffsets: offsets)
    }
}

struct NotificationRow: View {
    let notification: NotificationItem
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: notification.icon)
                .foregroundColor(notification.color)
                .font(.title2)
                .frame(width: 40, height: 40)
                .background(notification.color.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(notification.message)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(notification.timeAgo)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if !notification.isRead {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.vertical, 4)
    }
}

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let timeAgo: String
    let icon: String
    let color: Color
    let isRead: Bool
}

private let sampleNotifications: [NotificationItem] = [
    NotificationItem(
        title: "New Recipe Added",
        message: "Check out the new 'Chocolate Lava Cake' recipe that was just added!",
        timeAgo: "2 minutes ago",
        icon: "plus.circle.fill",
        color: .green,
        isRead: false
    ),
    NotificationItem(
        title: "Recipe Saved",
        message: "You saved 'Classic Greek Salad' to your favorites",
        timeAgo: "1 hour ago",
        icon: "heart.fill",
        color: .red,
        isRead: false
    ),
    NotificationItem(
        title: "Cooking Reminder",
        message: "Don't forget to prepare your ingredients for tonight's dinner!",
        timeAgo: "3 hours ago",
        icon: "bell.fill",
        color: .orange,
        isRead: true
    ),
    NotificationItem(
        title: "Weekly Challenge",
        message: "This week's challenge: Cook a recipe from a different cuisine!",
        timeAgo: "1 day ago",
        icon: "trophy.fill",
        color: .yellow,
        isRead: true
    ),
    NotificationItem(
        title: "Recipe Rating",
        message: "Your recipe 'Pasta Carbonara' received a 5-star rating!",
        timeAgo: "2 days ago",
        icon: "star.fill",
        color: .yellow,
        isRead: true
    )
]

#Preview {
    NotificationsView()
} 