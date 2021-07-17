import 'package:help_mate/models/models.dart';

// dummy user
final users = [
  User(
      email: "alex@jones.com", userId: "0", name: "Alex Jones", country: "USA"),
  User(email: "john@wick.com", userId: "1", name: "John Wick", country: "USA"),
  User(
      email: "deckard@shaw.co.uk",
      userId: "2",
      name: "Deckard Shaw",
      country: "UK"),
  User(
      email: "jotaro@kujo.jp", userId: "3", name: "Jotaro Kujo", country: "JPN")
];

// dummy comments
final comments = [
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"]),
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"]),
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"]),
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"]),
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"]),
  Comment.name(
      commentId: "0",
      postId: "0",
      userId: "0",
      commentContent: "This is a comment",
      timeStamp: 100200203,
      likesOnComment: 10,
      tagIds: ["2", "3", "34"],
      whoLiked: ["1", "4", "2"])
];

// dummy tags
final tags = [
  Tag(tagId: "0", tagName: "Education", tagDescription: "Learning about stuff"),
  Tag(tagId: "1", tagName: "Maths", tagDescription: "Numbers and Algorithms"),
  Tag(
      tagId: "2",
      tagName: "Science",
      tagDescription: "Biology, Chemistry & Physics"),
  Tag(tagId: "3", tagName: "Health", tagDescription: "Psychology & wellbeing"),
  Tag(tagId: "4", tagName: "Computers", tagDescription: "Programming"),
  Tag(tagId: "5", tagName: "English", tagDescription: ""),
  Tag(tagId: "6", tagName: "Art", tagDescription: "Painting & Drawing"),
  Tag(
      tagId: "7",
      tagName: "History",
      tagDescription: "The past and how that affects the future")
];

//// dummy posts
// final posts = [
//   Post.name(
//     postId: 0,
//     postContent: "yeaaaaaah man, that's like, super wicked",
//     timeStamp : ,
//     tagIds,
//     whoPosted)
// ];
