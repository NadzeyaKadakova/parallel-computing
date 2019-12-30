package ParallelComputing.GaussSlau;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        @SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);
        System.out.print("Введите размерность матриц: ");
        int rows = sc.nextInt();
        double value;
        //Создаем матрицу
        Matrix mat1 = new Matrix();
        mat1.setSize(rows, rows);
        //Вводим значения первой матрицы
        System.out.println("Ввод первой матрицы: ");
        for (int i=0; i<rows; i++){
            int iNum = i+1;
            for (int j=0; j<rows; j++){
                int jNum = j+1;
                System.out.println("Введите "+jNum+" элемент "+iNum+" столбца: ");
                value = sc.nextDouble();
                mat1.setElem(i, j, value);
            }
        }

                   Matrix gaussMt = MatrixCalculator.gauss(mat1);
                 
                    System.out.println("Приведенная  матрица: \n"+gaussMt.toString());
                   
        }
  
        
   
}
