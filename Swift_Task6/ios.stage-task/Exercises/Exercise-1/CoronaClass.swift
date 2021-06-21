import Foundation

class CoronaClass {
 
     var seats = [Int]()
     var countTables:Int
     var  distArray:Array<Int> = []

     init(n: Int) {
        self.countTables = n
     }
     
     func seat() -> Int {
        
        var place:Int = 0
        
        if seats.count == 0 {
            place = 0
        } else {
        
        if ((seats.count == 1) && (seats[0] == 0)) {
            place = countTables - 1
        } else {
        
        if ((seats.count < countTables) && (seats.count != 0) && (seats[0] != 0)) {
            place = 0
        } else {
            distArray.removeAll()
            
            var betweenValues = 1
            for i in 1..<countTables {
                    if (i != seats[betweenValues]) {
                        distArray.append(i)
                    } else {
                        if seats.last! == countTables - 1   {
                            betweenValues += 1}}
            }
            
            var minIndex:Int = 0
            var minArray = [[Int]]()
            var distMin:Int = countTables
            for i in distArray {
                for j in seats {
                    if abs(i - j) < distMin {
                        distMin = abs(i - j)
                        minIndex = i
                    }
                }
                minArray.append([distMin,minIndex])
                distMin = countTables
            }

            let sortedArray = minArray.sorted(by: {($0[0] as Int) > ($1[0] as Int) })
            place = sortedArray[0][1]
            
        }}}
        
        seats.append(place)
        seats = seats.sorted(by: <)
        
        return place
     }
     
     func leave(_ man: Int) {
        
        if let index = seats.firstIndex(of: man) {
            seats.remove(at: index)
        }
     }
}
