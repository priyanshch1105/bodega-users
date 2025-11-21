import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class BoAssistantScreen extends StatefulWidget {
  @override
  _BoAssistantScreenState createState() => _BoAssistantScreenState();
}

class _BoAssistantScreenState extends State<BoAssistantScreen> {
  late final RecorderController _recorderController;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _recorderController = RecorderController();
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      await _recorderController.stop();
    } else {
      await _recorderController.record();
    }
    setState(() => _isRecording = !_isRecording);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              /// Title
              Text(
                "BO is Listening",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text(context),
                ),
              ),

              const SizedBox(height: 40),

              /// Circular mic button with waveform
              GestureDetector(
                onTap: _toggleRecording,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/boassistant.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: AudioWaveforms(
                      enableGesture: false,
                      size: const Size(80, 40),
                      recorderController: _recorderController,
                      waveStyle: const WaveStyle(
                        waveColor: Colors.white,
                        extendWaveform: true,
                        showMiddleLine: false,
                        spacing: 6,
                        waveCap: StrokeCap.round,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Speak text
              Text(
                "Speak",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.text(context),
                ),
              ),

              const Spacer(),

              /// Back Button (fixed at bottom)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button(context),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.buttontext(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
