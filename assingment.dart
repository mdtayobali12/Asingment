// Define Role interface
abstract class Role {
  void displayRole();
}

// Define Person class implementing Role interface
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print('Role: Person');
  }

  String getName() {
    return name;
  }

  int getAge() {
    return age;
  }

  String getAddress() {
    return address;
  }
}

// Define Student class extending Person
class Student extends Person {
  int studentId;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentId, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${calculateAverageScore().toStringAsFixed(1)}');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Define Teacher class extending Person
class Teacher extends Person {
  String teacherId;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherId, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

// Define StudentManagementSystem class with main method
void main() {
  // Create instances of Student and Teacher classes
  var student = Student('John Doe', 20, '123 Main St', 123, [90, 85, 82]);
  var teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T123', ['Math', 'English', 'Bangla']);

  // Display the role of each person
  student.displayRole();
  print('\n');
  teacher.displayRole();
}