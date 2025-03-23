/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.homepage.blog;

import java.util.*;
import java.io.*;
import static java.lang.Math.sqrt;

class Main {

    public static int[] sortByFrequency(int[] arr) {

        List<List<Integer>> list = new ArrayList<>();
        for (int i = 0; i < arr.length; i++) {
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] > arr[j]) {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }

            }
        }
        int index = 0;

        for (int i = 0; i < arr.length;) { // Bỏ index, dùng i trực tiếp
            List<Integer> so = new ArrayList<>();
            so.add(arr[i]); // Thêm chính arr[i] vào nhóm
            int j;
            for (j = i + 1; j < arr.length; j++) {
                if (arr[j] == arr[i]) {
                    so.add(arr[j]);
                } else {
                    break; // Thoát khi gặp phần tử khác
                }
            }
            list.add(so);
            i = j; // Cập nhật i để nhảy đến phần tử khác
        }

        for (int i = 0; i < list.size(); i++) {
            for (int j = i + 1; j < list.size(); j++) {
                if (list.get(i).size() < list.get(j).size()) {
                    List<Integer> temp = list.get(i);
                    list.set(i, list.get(j));
                    list.set(j, temp);

                }

            }
        }

        int[] result = new int[arr.length];
        int indexx = 0;
        for (List<Integer> l : list) {
            for (Integer li : l) {
                result[indexx++] = li;
            }

        }
        return result;

    }

    public static void main(String[] args) {
        int[] arr = {1, 1, 2, 2, 2, 3};
        System.out.println(Arrays.toString(sortByFrequency(arr)));

    }

}
