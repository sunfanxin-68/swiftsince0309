//: [Previous](@previous)

import Foundation


int fd = open("somefile", O_RDWR);

if(fd ! = -1 ) {
    //何かファイルがここで開く
}

auto numbers = { 1, 2, 3 };
auto iterator0f4 = std::find(numbers.begin(),numbers.end(), 4);

if (iteratorOf4 != numbers.end()) {
    // 4 is found in numbers
}

NSString *tmp = nil;

if ([tmp rangeOfString: @"Swift"].location != NSNotFound) {
    // Will print out for nil string
    NSLog(@"Something about swift");
}
