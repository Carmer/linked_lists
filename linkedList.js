function Node(value, nextNode) {
  this.value = value;
  this.nextNode = nextNode;
}

function List(headNodeValue) {
  this.head = new Node(headNodeValue);
}

List.prototype.tail = function {
  var currentNode = this.headNode;
  
}
