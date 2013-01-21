package unit;

abstract MyAbstract(Int) {

    public inline function new(x) {
        this = x;
    }

    public inline function incr() {
        return ++this;
    }

    public inline function toInt() : Int {
        return this;
    }

}

abstract TemplateWrap(haxe.Template) {
	public inline function new(x) {
		this = new haxe.Template(x);
	}
	
	public inline function get()
		return this
	
	@:from static inline public function fromString(s:String) {
		return new TemplateWrap(s);
	}
	
	@:to inline function toString() {
		return this.execute( { t: "really works!"});
	}
}

abstract Meter(Float) {
	public inline function new(f)
		this = f
	
	public inline function get()
		return this
		
	@:from static public inline function fromFloat(f:Float)
		return new Meter(f)
}

abstract Kilometer(Float) {
	public inline function new(f)
		this = f
		
	@:from static public inline function fromMeter(m:Meter)
		return new Kilometer(m.get() / 1000.)
		
	@:to public inline function toFloat()
		return this
}

abstract MyHash(Hash<V>)<V> {
	private inline function new() {
		this = new Hash<V>();
	}
	public inline function set(k:String, v:V)
		this.set(k, v)
	public inline function get(k:String)
		return this.get(k)
	public inline function toString()
		return this.toString()
		
	@:from static public function fromStringArray(arr:Array<String>) {
		var hash = new MyHash();
		var i = 0;
		while (i < arr.length) {
			var k = arr[i++];
			var v = arr[i++];
			hash.set(k, v);
		}
		return hash;
	}
	
	@:from static public function fromArray<K>(arr:Array<K>) {
		var hash = new MyHash();
		var i = 0;
		while (i < arr.length) {
			var k = arr[i++];
			var v = arr[i++];
			hash.set(Std.string('_s$k'), v);
		}
		return hash;
	}
}