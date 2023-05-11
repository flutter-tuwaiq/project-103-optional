## Assessment: Creating a Post API with Dart and Shelf

In this assessment, you'll be implementing a simple Post API using the Dart programming language and the Shelf package. The API will have the following endpoints:

- `POST /posts`: creates a new Post and saves it to a file named `posts.txt`.
- `GET /posts/:id`: retrieves a single Post by its ID from the `posts.txt` file.
- `DELETE /posts/:id`: deletes a single Post by its ID from the `posts.txt` file.

You should use the `shelf_hotreload` package to automatically reload the server whenever you make changes to the code. You should also use the `dart_code_metrics` package to ensure that your code is maintainable and follows best practices.

### Requirements

Your code should meet the following requirements:

- Use at least one Model to represent a Post.
- Split your code into different files and folders for clarity and organization:
  - The `Routes` folder should contain the router handlers for each endpoint.
  - The `Response` folder should contain the handler methods that generate the responses for each endpoint.
- All endpoints should return JSON responses with the appropriate HTTP status codes and headers.
- All endpoints should handle errors gracefully and return appropriate error responses with JSON payloads.
- The `POST /posts` endpoint should accept a JSON payload in the request body with the following fields:
  - `id` (string): the ID of the new Post.
  - `content` (string): the content of the new Post.
  - `name` (string): the name of the author of the new Post.

### Tips

- You can use the `dart:io` library to read and write files. The `File` class provides a simple interface for working with files.
- You can use the `json` package to serialize and deserialize JSON data. The `jsonDecode` and `jsonEncode` functions can convert between JSON strings and Dart objects.

### Bonus

If you finish the main requirements quickly, you can try adding the following features:

- Add validation for the request payload of the `POST /posts` endpoint.
