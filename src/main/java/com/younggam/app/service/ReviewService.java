package com.younggam.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younggam.app.mapper.ReviewInfoMapper;
import com.younggam.app.vo.ReviewInfoVO;

@Service
public class ReviewService {
   
   @Autowired
   private ReviewInfoMapper riMapper;
   
   //일반 목록
   public List<ReviewInfoVO> selectReviewInfos(ReviewInfoVO reviews){
      return riMapper.selectReviewInfos(reviews);
   }
   
   //장르 정렬한 목록
   public List<ReviewInfoVO> selectReviewInfoSortGenre(ReviewInfoVO reviews){
      return riMapper.selectReviewInfoSortGenre(reviews);
   }
   
   //리뷰 작성
   public boolean insertReviewInfo(ReviewInfoVO review) {
      int result = riMapper.insertReviewInfo(review);
      if(result == 1) {
         return true;
      }
      return false;
   }
   
   //리류 상세
   public ReviewInfoVO selectReviewInfo (int riNum) {
	   ReviewInfoVO review = riMapper.selectReviewInfo(riNum);
	   if(review != null) {
		   riMapper.updateReviewInfoVeiwCnt(review);
	   }
      return review;
   }
   
   //리뷰 수정
   public boolean updateReviewInfo(ReviewInfoVO review) {
	  int result = riMapper.updateReviewInfo(review);
	  if(result == 1) {
          return true;
       }
       return false;
    }
   
   
   //리뷰 삭제
   public boolean deleteReviewInfo(int riNum) {
	   return riMapper.deleteReviewInfo(riNum) == 1;
   }
   
   
   //작성한 리뷰 조회하기
   public List<ReviewInfoVO> selectUserReviewInfos(String uiNickname){
	   // PageHelper.startPage(uiNickname.getPage(), uiNickname.getRows());
      return riMapper.selectUserReviewInfos(uiNickname);
   }
}