import 'dart:ffi';
//import 'dart:html';
import 'dart:io';


void liste(List l1, List l2){
   print(Set.from(l1).intersection(Set.from(l2)).toList());}
  

void main() {    
    List l =[1 ,4,42,56];
    List l2= [1, 0,42 , 7];
    liste(l, l2);}