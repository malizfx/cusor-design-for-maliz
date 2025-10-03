import { View, Text, StyleSheet } from 'react-native';

export default function ProgressScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Progress</Text>
      <Text style={styles.subtitle}>Charts and insights coming soon.</Text>
      <View style={styles.chart}>
        <Text style={styles.chartText}>Estimated 1RM (Bench)</Text>
      </View>
      <View style={styles.chart}>
        <Text style={styles.chartText}>Weekly Volume (Chest)</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: '#0B0F13', padding: 20, paddingTop: 64 },
  title: { color: '#FFFFFF', fontSize: 24, fontWeight: '700', marginBottom: 8 },
  subtitle: { color: '#9CA3AF', marginBottom: 12 },
  chart: { backgroundColor: '#111827', borderColor: '#1F2937', borderWidth: 1, borderRadius: 12, padding: 24, marginBottom: 12 },
  chartText: { color: '#9CA3AF', textAlign: 'center' },
});

