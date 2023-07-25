//P: They are the business objects of the application (Enterprise-wide business rules)
// and encapsulate the most general and high-level rules.

//P: An entity can be an object with methods, or it can be a set of
//P: data structures and functions.

//P: class here won't have any dependency on other layers

// In the context of Clean Architecture, "business objects" refer to the main components
// or objects that the application is built around. These are usually things that
// represent real-world objects or concepts that are relevant to what the
// application does. For example, in a our app, some of the business objects
// might be User, Quiz, or Course..etc.

//reference entity:
//class AuthUser extends Equatable {
//   final String id;
//   final String email;
//   final String? name;
//   final String? photoURL;

//   // final int age;
//
//   const AuthUser({
//     required this.id,
//     required this.email,
//     this.name,
//     this.photoURL,
//   });
//
//   static const AuthUser empty = AuthUser(
//     id: '',
//     name: '',
//     email: '',
//     photoURL: '',
//   );
//
//   bool get isEmpty => this == AuthUser.empty;
//
//   @override
//   List<Object?> get props => [id, name, email, photoURL];
//
// }