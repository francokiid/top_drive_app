class Review {
  final String title;
  final String content;
  final double rating;

  Review({
    required this.title,
    required this.content,
    required this.rating,
  });
}

// Example list of reviews
List<Review> reviews = [
  Review(
    title: 'Great Instructor!',
    content: 'Miss One is very patient and knowledgeable. I learned a lot from her lessons.',
    rating: 4.5,
  ),
  Review(
    title: 'Highly Recommended!',
    content: 'Best driving instructor I\'ve ever had. Helped me pass my driving test on the first try!',
    rating: 5.0,
  ),
  Review(
    title: 'Excellent Service!',
    content: 'I had a wonderful experience learning with Miss One. She made driving lessons enjoyable and effective.',
    rating: 4.8,
  ),
];