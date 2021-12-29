class Info{
  int? worker_id;
  int? worker_group_id;
  int? user_business_id;
  String? firstname;
  String? lastname;
  String? patronymic;
  String? initials;
  String? email;
  String? telephone;
  dynamic image;
  DateTime? date_added;
  DateTime? date_modified;
  String? post;

  Info({
      this.worker_id,
      this.worker_group_id,
      this.user_business_id,
      this.firstname,
      this.lastname,
      this.patronymic,
      this.initials,
      this.email,
      this.telephone,
      this.image,
      this.date_added,
      this.date_modified,
      this.post});

  factory Info.fromMap(Map<String, dynamic> map){
    return Info(
      worker_id: map['worker_id'],
      worker_group_id: map['worker_group_id'],
      user_business_id: map['user_business_id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      patronymic: map['patronymic'],
      initials: map['initials'],
      email: map['email'],
      telephone: map['telephone'],
      image: map['image'],
      date_added: map['date_added'],
      date_modified: map['date_modified'],
      post: map['post']
    );
  }
}