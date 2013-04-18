object GroupBy {

  def bar = {
    println("ritesh")
  }

  def test = {
    val x = List(2, 3, 4, 1)
    val last = 2
    val r = x.groupBy { f => f == last }

    val y = r(false) ++ r(true)

    println(y)
  }

}
