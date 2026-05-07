// lib/features/auth/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? profileImageUrl;
  final bool isPremium;
  final DateTime joinedDate;
  final DateTime? premiumExpiryDate;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
    required this.isPremium,
    required this.joinedDate,
    this.premiumExpiryDate,
  });

  // Factory method for creating a demo user
  factory UserModel.demo() {
    return UserModel(
      id: 'user_123',
      email: 'john.doe@example.com',
      name: 'John Doe',
      profileImageUrl: null,
      isPremium: true,
      joinedDate: DateTime(2024, 1, 15),
      premiumExpiryDate: DateTime(2025, 12, 31),
    );
  }

  // Copy with method for updating user data
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImageUrl,
    bool? isPremium,
    DateTime? joinedDate,
    DateTime? premiumExpiryDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isPremium: isPremium ?? this.isPremium,
      joinedDate: joinedDate ?? this.joinedDate,
      premiumExpiryDate: premiumExpiryDate ?? this.premiumExpiryDate,
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'isPremium': isPremium,
      'joinedDate': joinedDate.toIso8601String(),
      'premiumExpiryDate': premiumExpiryDate?.toIso8601String(),
    };
  }

  // Create from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      isPremium: json['isPremium'],
      joinedDate: DateTime.parse(json['joinedDate']),
      premiumExpiryDate: json['premiumExpiryDate'] != null
          ? DateTime.parse(json['premiumExpiryDate'])
          : null,
    );
  }
}

// Auth State
class AuthState {
  final UserModel? user;
  final bool isLoading;
  final bool isAuthenticated;
  final String? errorMessage;

  AuthState({
    this.user,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.errorMessage,
  });

  String? get email => null;

  AuthState copyWith({
    UserModel? user,
    bool? isLoading,
    bool? isAuthenticated,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState()) {
    // Check for existing session on startup
    checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> checkAuthStatus() async {
    state = state.copyWith(isLoading: true);

    // Simulate checking stored credentials
    await Future.delayed(const Duration(seconds: 1));

    // For demo purposes, we'll auto-login with demo user
    // In a real app, you would check shared preferences or secure storage
    final hasLoggedInUser = true; // This would be from secure storage

    if (hasLoggedInUser) {
      state = state.copyWith(
        user: UserModel.demo(),
        isAuthenticated: true,
        isLoading: false,
        errorMessage: null,
      );
    } else {
      state = state.copyWith(isLoading: false, isAuthenticated: false);
    }
  }

  // Login with email and password
  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Please fill in all fields',
      );
      return false;
    }

    if (password.length < 6) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Password must be at least 6 characters',
      );
      return false;
    }

    // Demo credentials check
    if (email == 'demo@example.com' && password == 'password123') {
      state = state.copyWith(
        user: UserModel.demo(),
        isAuthenticated: true,
        isLoading: false,
        errorMessage: null,
      );
      return true;
    }

    // For demo, any email/password combination works (except empty)
    // In a real app, you would call your authentication API
    state = state.copyWith(
      user: UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        name: email.split('@')[0],
        isPremium: false,
        joinedDate: DateTime.now(),
      ),
      isAuthenticated: true,
      isLoading: false,
      errorMessage: null,
    );
    return true;
  }

  // Sign up with email and password
  Future<bool> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Validation
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Please fill in all fields',
      );
      return false;
    }

    if (password != confirmPassword) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Passwords do not match',
      );
      return false;
    }

    if (password.length < 6) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Password must be at least 6 characters',
      );
      return false;
    }

    if (!email.contains('@') || !email.contains('.')) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Please enter a valid email address',
      );
      return false;
    }

    // Create new user
    state = state.copyWith(
      user: UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        email: email,
        name: name,
        isPremium: false,
        joinedDate: DateTime.now(),
      ),
      isAuthenticated: true,
      isLoading: false,
      errorMessage: null,
    );
    return true;
  }

  // Social login (Google, Apple, Facebook)
  Future<bool> socialLogin(String provider) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate API call for social login
    await Future.delayed(const Duration(seconds: 1));

    // In a real app, you would integrate with Google Sign-In, Apple Sign-In, etc.
    state = state.copyWith(
      user: UserModel(
        id: 'social_${DateTime.now().millisecondsSinceEpoch}',
        email: 'user@${provider.toLowerCase()}.com',
        name: '$provider User',
        isPremium: false,
        joinedDate: DateTime.now(),
      ),
      isAuthenticated: true,
      isLoading: false,
      errorMessage: null,
    );
    return true;
  }

  // Forgot password
  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || !email.contains('@')) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Please enter a valid email address',
      );
      return false;
    }

    // In a real app, you would send a password reset email
    state = state.copyWith(isLoading: false, errorMessage: null);
    return true;
  }

  // Update user profile
  Future<bool> updateProfile({
    String? name,
    String? email,
    String? profileImageUrl,
  }) async {
    state = state.copyWith(isLoading: true);

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (state.user != null) {
      final updatedUser = state.user!.copyWith(
        name: name,
        email: email,
        profileImageUrl: profileImageUrl,
      );

      state = state.copyWith(user: updatedUser, isLoading: false);
      return true;
    }

    state = state.copyWith(isLoading: false);
    return false;
  }

  // Upgrade to premium
  Future<bool> upgradeToPremium() async {
    state = state.copyWith(isLoading: true);

    // Simulate API call for payment processing
    await Future.delayed(const Duration(seconds: 2));

    if (state.user != null) {
      final updatedUser = state.user!.copyWith(
        isPremium: true,
        premiumExpiryDate: DateTime.now().add(const Duration(days: 365)),
      );

      state = state.copyWith(user: updatedUser, isLoading: false);
      return true;
    }

    state = state.copyWith(isLoading: false);
    return false;
  }

  // Logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));

    // Clear user data
    state = AuthState();
  }

  // Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

// Provider for auth state
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Provider to get current user (convenience provider)
final currentUserProvider = Provider<UserModel?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.user;
});

// Provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.isAuthenticated;
});

// Provider to check if user is premium
final isPremiumProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.user?.isPremium ?? false;
});
