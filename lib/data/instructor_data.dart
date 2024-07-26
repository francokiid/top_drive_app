class InstructorData {
  final String name;
  final String image;
  final String email;

  InstructorData({required this.name, required this.image, required this.email});
}

final List<InstructorData> instructors = [
  InstructorData(name: 'Maraiah Cruz', image: 'assets/images/instructor1.jpg', email: 'maraiahcruz@gmail.com'),
  InstructorData(name: 'John Dexter Chua', image: 'assets/images/instructor2.png', email: 'johnchua@gmail.com'),
  InstructorData(name: 'Ian Garcia', image: 'assets/images/instructor3.png', email: 'iantatts@gmail.com'),
  InstructorData(name: 'Roberto Downey', image: 'assets/images/instructor4.jpg', email: 'rdjironman@gmail.com'),
];
