/*
  Warnings:

  - You are about to drop the `_MCQAnswerToMCQuestion` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_MCQAnswerToMCQuestion" DROP CONSTRAINT "_MCQAnswerToMCQuestion_A_fkey";

-- DropForeignKey
ALTER TABLE "_MCQAnswerToMCQuestion" DROP CONSTRAINT "_MCQAnswerToMCQuestion_B_fkey";

-- DropForeignKey
ALTER TABLE "mc_question_answers" DROP CONSTRAINT "mc_question_answers_question_id_fkey";

-- DropTable
DROP TABLE "_MCQAnswerToMCQuestion";
