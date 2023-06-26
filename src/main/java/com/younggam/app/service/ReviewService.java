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
   
   public boolean insertReviewInfo(ReviewInfoVO review) {
      int result = riMapper.insertReviewInfo(review);
      if(result == 1) {
         return true;
      }
      return false;
   }
   
   public ReviewInfoVO selectReviewInfo (int riNum) {
      return riMapper.selectReviewInfo(riNum);
   }
   
   
   //작성한 리뷰 조회하기
   public List<ReviewInfoVO> selectUserReviewInfos(String uiNickname){
      return riMapper.selectUserReviewInfos(uiNickname);
   }
}