
//todo: auth 3) import auth_user entity and create an abstract class AuthRepository

//P: repo is for doing ur CRUD operations
//P: repo of domain layer doesn't specify about how data is stored or fetched
//P: it defines what to do with that data
//P: so ur first step would be to decide what data u want and from which data source and which entities are involved in this

/*
This is crucial for the Clean Architecture's goal of separation
of concerns and making the system more flexible and adaptable.
If you want to change how the data is stored - say, moving
from a relational database to a NoSQL database, or even
to an in-memory database for testing - you can do so
by implementing a new Repository that adheres to the same
interface, without having to change your application's core logic.

The main role of a Repository is to hide the details of how data
for the entities is fetched or stored. It provides a clean API
for the rest of the application to obtain domain entities without needing to know
where they come from or what type of infrastructure is used to store them.
 */

///P: Single Responsibility: Each Repository has a single responsibility,
/// which is to provide data for a specific type of entity.