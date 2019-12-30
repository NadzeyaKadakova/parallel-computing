package ParallelComputing.GaussSlau;


public class MatrixCalculator{
    	private MatrixCalculator() {
}
      
public static Matrix creatMatrix(int rows, int columns, double[][] data){
    Matrix mt = Matrix.creatMatrix(rows, columns);
        for(int i=0; i<data.length; i++){
            for(int j=0; j<data[i].length; j++){
        mt.setElem(i, j, data[i][j]);
            }
        }
    return mt;
  }

public static Matrix swapLine(int swopLine, int targetLine, Matrix mt1) {
    int rows = mt1.getSize().getRows();
    int cols = mt1.getSize().getColumns();
    double tmp;
    int secondLine = targetLine;
        for (int firstLine=swopLine; swopLine<rows; swopLine++) {
            for (int j=0; j<cols; j++) {
                tmp = mt1.getElem(firstLine, j);
                mt1.setElem(firstLine, j, mt1.getElem(secondLine, j));
                mt1.setElem(secondLine, j, tmp);
            }
        }
    return mt1;
}

public static Matrix gauss (Matrix mt1) {
    int rows = mt1.getSize().getRows();
    int cols = mt1.getSize().getColumns();
    int count;
    Matrix mt = new Matrix();
    mt.setSize(rows, cols);
    for (int i=0; i<rows; i++){
        for (int j=0; j<cols; j++){
            mt.setElem(i, j, mt1.getElem(i, j));
        }
    }
    /*копируем полученную матрицу в "статическую" матрицу mt2, в неё 
     копируется "рабочая матрица" mt, после зануления очередного столбца*/
    Matrix mt2 = new Matrix();
    mt2.setSize(rows, cols);
    for (int i=0; i<rows; i++){
        for (int j=0; j<cols; j++){
            mt2.setElem(i, j, mt1.getElem(i, j));
        }
    }
    for (int i=0; i<cols; i++){
        
        //проверка на НЕнулевой i-тый элемент строки
        if (mt.getElem(i, i)==0 && i<rows-1)
        {
        count = i;
            do{
            mt.getElem(count, 0);
            count++;
            }while(mt.getElem(count, 0) == 0);
        mt = MatrixCalculator.swapLine(i, count, mt);
        }          
        for (int x=0; x<rows; x++){
            for (int y=0; y<cols; y++){
                mt2.setElem(x, y, mt.getElem(x, y));
            }
        }
        
        //зануление i-того столбца         
        for (int j=i+1; j<rows; j++){
            for (int k=i; k<cols; k++){
                double tmp = mt.getElem(j, k)-((mt.getElem(i, k)*mt2.getElem(j, i))/mt.getElem(i, i));
                mt.setElem(j, k, tmp);
            }                
        }
        
    } 
    return mt;
}
}
