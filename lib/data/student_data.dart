class Student {
  final String name;
  final String status;
  final List<String> courses;
  final String email;

  const Student({
    required this.name,
    required this.status,
    required this.courses,
    required this.email,
  });
}

List<Student> currentStudents = [
  const Student(
    name: 'Sarah White',
    status: 'Current',
    courses: [
      'Practical Driving Course - 2 Wheels',
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'sarah.white@gmail.com',
  ),
  const Student(
    name: 'Daniel Davis',
    status: 'Current',
    courses: [
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'daniel.davis@gmail.com',
  ),
  const Student(
    name: 'Olivia Martinez',
    status: 'Current',
    courses: [
      'Theoretical Driving Course',
    ],
    email: 'olivia.martinez@gmail.com',
  ),
  const Student(
    name: 'James Lee',
    status: 'Current',
    courses: [
      'Practical Driving Course - 2 Wheels',
    ],
    email: 'james.lee@gmail.com',
  ),
  const Student(
    name: 'Sophia Taylor',
    status: 'Current',
    courses: [
      'Practical Driving Course - 2 Wheels',
    ],
    email: 'sophia.taylor@gmail.com',
  ),
];

List<Student> pastStudents = [
  const Student(
    name: 'Andrew Wilson',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
    ],
    email: 'andrew.wilson@gmail.com',
  ),
  const Student(
    name: 'Emma Johnson',
    status: 'Past',
    courses: [
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'emma.johnson@gmail.com',
  ),
  const Student(
    name: 'William Brown',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
      'Practical Driving Course - 2 Wheels',
    ],
    email: 'william.brown@gmail.com',
  ),
  const Student(
    name: 'Mia Davis',
    status: 'Past',
    courses: [
      'Practical Driving Course - 2 Wheels',
    ],
    email: 'mia.davis@gmail.com',
  ),
  const Student(
    name: 'Alexander Smith',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'alexander.smith@gmail.com',
  ),
  const Student(
    name: 'Sophie Garcia',
    status: 'Past',
    courses: [
      'Practical Driving Course - 2 Wheels',
    ],
    email: 'sophie.garcia@gmail.com',
  ),
  const Student(
    name: 'Liam Martinez',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'liam.martinez@gmail.com',
  ),
  const Student(
    name: 'Ava Lee',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
    ],
    email: 'ava.lee@gmail.com',
  ),
  const Student(
    name: 'Noah Wilson',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'noah.wilson@gmail.com',
  ),
  const Student(
    name: 'Isabella Taylor',
    status: 'Past',
    courses: [
      'Theoretical Driving Course',
      'Practical Driving Course - 2 Wheels',
      'Practical Driving Course - 4 Wheels',
    ],
    email: 'isabella.taylor@gmail.com',
  ),
];