/*
  Warnings:

  - You are about to drop the `mc_question_answers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `mc_questions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `quiz` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `quiz_questions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "mc_questions" DROP CONSTRAINT "mc_questions_quizQuestionId_fkey";

-- DropForeignKey
ALTER TABLE "quiz" DROP CONSTRAINT "quiz_quizQuestionId_fkey";

-- DropTable
DROP TABLE "mc_question_answers";

-- DropTable
DROP TABLE "mc_questions";

-- DropTable
DROP TABLE "quiz";

-- DropTable
DROP TABLE "quiz_questions";
