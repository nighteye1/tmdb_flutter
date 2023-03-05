enum Status { success, error, loading }

class ApiResponse<T> {
  ApiResponse({this.status, this.data, this.message});

  Status? status;
  T? data;
  String? message;
}
