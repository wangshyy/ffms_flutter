class TodoBean {
  int? id;
  String? title;
  String? description;
  String? date;

  TodoBean({this.id, this.title, this.description, this.date});

  TodoBean.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}
