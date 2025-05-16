class LeadModel {
  final int? id;
  final String? name;
  final String? clientName;
  final String? product;
  final String? bankName;
  final String? addressType;
  final String? address;
  final String? applicationNo;
  final String? verificationType;
  final String? typeOfVisit;
  final String? contactNo;
  final int? assignedTo;
  final int? assignedBy;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  LeadModel({
    this.id,
    this.name,
    this.clientName,
    this.product,
    this.bankName,
    this.addressType,
    this.address,
    this.applicationNo,
    this.verificationType,
    this.typeOfVisit,
    this.contactNo,
    this.assignedTo,
    this.assignedBy,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory LeadModel.empty() {
    return LeadModel(
      id: null,
      name: null,
      clientName: null,
      product: null,
      bankName: null,
      addressType: null,
      address: null,
      applicationNo: null,
      verificationType: null,
      typeOfVisit: null,
      contactNo: null,
      assignedTo: null,
      assignedBy: null,
      status: null,
      createdAt: null,
      updatedAt: null,
    );
  }

  factory LeadModel.fromJson(Map<String, dynamic> json) { 
    // Parse status - handle both string and int
    int? statusValue;
    if (json['status'] != null) {
      if (json['status'] is int) {
        statusValue = json['status'];
      } else if (json['status'] is String) {
        statusValue = int.tryParse(json['status']);
      }
    }

    // Parse assignedTo - handle both string and int
    int? assignedToValue;
    if (json['assigned_to'] != null) {
      if (json['assigned_to'] is int) {
        assignedToValue = json['assigned_to'];
      } else if (json['assigned_to'] is String) {
        assignedToValue = int.tryParse(json['assigned_to']);
      }
    }

    // Parse assignedBy - handle both string and int
    int? assignedByValue;
    if (json['assigned_by'] != null) {
      if (json['assigned_by'] is int) {
        assignedByValue = json['assigned_by'];
      } else if (json['assigned_by'] is String) {
        assignedByValue = int.tryParse(json['assigned_by']);
      }
    }

    return LeadModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      name: json['name'],
      clientName: json['client_name'],
      product: json['product'],
      bankName: json['bank_name'],
      addressType: json['address_type'],
      address: json['address'],
      applicationNo: json['application_no'],
      verificationType: json['verification_type'],
      typeOfVisit: json['type_of_visit'],
      contactNo: json['contact_no'],
      assignedTo: assignedToValue,
      assignedBy: assignedByValue,
      status: statusValue,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'client_name': clientName,
      'product': product,
      'bank_name': bankName,
      'address_type': addressType,
      'address': address,
      'application_no': applicationNo,
      'verification_type': verificationType,
      'type_of_visit': typeOfVisit,
      'contact_no': contactNo,
      'assigned_to': assignedTo,
      'assigned_by': assignedBy,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
