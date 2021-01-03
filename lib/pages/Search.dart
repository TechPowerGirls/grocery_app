import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Products')
        .where('searchKey',
            arrayContains: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}
