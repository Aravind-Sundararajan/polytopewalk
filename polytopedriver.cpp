#include <iostream>
#include <fstream>
#include <cmath>
#include <algorithm>
#include <eigen3/Eigen/Dense>
#include "dikin_walker.hpp"
#include "vaidya_walker.hpp"
#include "john_walker.hpp"
#include "public_interface.hpp"
using namespace std;

void writeToCSVfile(const std::string& Aname, Eigen::MatrixXd matrix)
{
		Eigen::IOFormat CSVFormat(Eigen::StreamPrecision, Eigen::DontAlignCols, ", ", "\n");
    ofstream file(Aname);
    file << matrix.format(CSVFormat);
    file.close();
 }


int main ()
{
	int DIM = 2;
	int NCON = 2*DIM;
	int nb_samples = 10000;
	double r = 1;
	Eigen::VectorXd initialization(DIM);
	Eigen::MatrixXd A(NCON,DIM);
	Eigen::VectorXd b(NCON);
	initialization.setZero();
	A.setZero();
	b.setZero();
	for (int X =0; X< DIM; X++){

		initialization(X) = .5;

		b(X) = 0;
		A(X,X) = -1;

		b(X+DIM) = 1;
		A(X+DIM,X) = 1;
	}
	std::string sep = "\n----------------------------------------\n";
	cout << "A\n" << A << sep;
	cout << "b\n" << b << sep;
	Eigen::MatrixXd H(A.rows(), A.cols()+b.cols());
	H << b, -A;
	cout << "H\n" << H << sep;
	Eigen::MatrixXd vo = generateVaidyaWalkSamples(initialization, A, b, r, nb_samples);
	writeToCSVfile("test.csv",vo.transpose());
	return 0;
}
