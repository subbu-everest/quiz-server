CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateTable
CREATE TABLE "mc_questions" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "question" TEXT NOT NULL,
    "option_1" TEXT NOT NULL,
    "option_2" TEXT NOT NULL,
    "option_3" TEXT NOT NULL,
    "option_4" TEXT NOT NULL,
    "quizQuestionId" UUID,

    CONSTRAINT "mc_questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mc_question_answers" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "question_id" UUID NOT NULL,
    "answer" TEXT NOT NULL,

    CONSTRAINT "mc_question_answers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "topic" TEXT NOT NULL,
    "quizQuestionId" UUID,

    CONSTRAINT "quiz_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "quiz_questions" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "quiz_id" UUID NOT NULL,
    "question_id" UUID NOT NULL,

    CONSTRAINT "quiz_questions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MCQAnswerToMCQuestion" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MCQAnswerToMCQuestion_AB_unique" ON "_MCQAnswerToMCQuestion"("A", "B");

-- CreateIndex
CREATE INDEX "_MCQAnswerToMCQuestion_B_index" ON "_MCQAnswerToMCQuestion"("B");

-- AddForeignKey
ALTER TABLE "mc_questions" ADD CONSTRAINT "mc_questions_quizQuestionId_fkey" FOREIGN KEY ("quizQuestionId") REFERENCES "quiz_questions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mc_question_answers" ADD CONSTRAINT "mc_question_answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "mc_questions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "quiz" ADD CONSTRAINT "quiz_quizQuestionId_fkey" FOREIGN KEY ("quizQuestionId") REFERENCES "quiz_questions"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MCQAnswerToMCQuestion" ADD FOREIGN KEY ("A") REFERENCES "mc_question_answers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MCQAnswerToMCQuestion" ADD FOREIGN KEY ("B") REFERENCES "mc_questions"("id") ON DELETE CASCADE ON UPDATE CASCADE;
