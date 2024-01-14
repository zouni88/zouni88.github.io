// --.\golang\go-zero\test_goctl--

class addReq{
	
	/// 
	final String book;
	
	/// 
	final int price;
	
	addReq({ 
		this.book,
		this.price,
	});
	factory addReq.fromJson(Map<String,dynamic> m) {
		return addReq(
			book: m['